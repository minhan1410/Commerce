package com.example.commerce.service.impl;

import com.example.commerce.model.dto.BlogDTO;
import com.example.commerce.model.dto.CategoriesBlogDTO;
import com.example.commerce.model.dto.CommentBlogDTO;
import com.example.commerce.model.entity.Blog;
import com.example.commerce.repository.BlogRepository;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BlogServiceImpl implements BlogService {
    private final BlogRepository blogRepository;
    private final ModelMapper mapper;
    private final CloudinaryService cloudinaryService;
    private final TagService tagService;
    private final CategoriesBlogService categoryBlogService;
    private final BlogTagService blogTagService;
    private final ProductService productService;
    private final CommentBlogService commentBlogService;

    @Override
    public List<BlogDTO> getAll() {
        List<BlogDTO> dtos = blogRepository.getByDeleted(false).stream().map(blog -> mapper.map(blog, BlogDTO.class)).toList();
        dtos.forEach(dto -> dto.setTags(blogTagService.getTag(dto.getId())));
        return dtos;
    }

    @Override
    public List<BlogDTO> getCategoryBlogId(Long id) {
        return blogRepository.getByCategoryBlogIdAndDeletedFalse(id).stream().map(blog -> mapper.map(blog, BlogDTO.class)).toList();
    }

    @Override
    public BlogDTO getById(Long id, Model model) {
        Optional<Blog> findBlog = blogRepository.findById(id);
        if (findBlog.isEmpty() || findBlog.get().getDeleted()) {
            model.addAttribute("err", "k ton tai");
            return null;
        }
        return mapper.map(findBlog.get(), BlogDTO.class);
    }

    @Override
    @Transactional
    public String add(BlogDTO dto, Model model) {
        cloudinaryService.uploadImageBlog(dto);
        blogRepository.save(mapper.map(dto, Blog.class));
        return "redirect:/admin/blog";
    }

    @Override
    @Transactional
    public String update(BlogDTO dto, Model model) {
        BlogDTO getById = getById(dto.getId(), model);
        if (Objects.isNull(getById)) {
            return "/admin/editBlog";
        }
        cloudinaryService.deleteImageBlog(dto, getById);
        cloudinaryService.uploadImageBlog(dto);
        blogRepository.save(mapper.map(getById, Blog.class).update(dto));
        return "redirect:/admin/blog";
    }

    @Override
    @Transactional
    public String delete(Long id, Model model) {
        BlogDTO getId = getById(id, model);
        if (getId != null) {
            getId.setDeleted(true);
            blogRepository.save(mapper.map(getId, Blog.class));
        }
        return "redirect:/admin/blog";
    }

    @Override
    @Transactional
    public void delete(List<BlogDTO> list, Model model) {
        list.forEach(dto -> delete(dto.getId(), model));
    }

    @Override
    public String getBlogForBlogPage(Model model, HttpServletRequest request) {
        String getKeyword = request.getParameter("keyword");
        String keyword = Objects.isNull(getKeyword) ? "" : getKeyword;

        String getPage = request.getParameter("page");
        Integer page = Objects.isNull(getPage) ? 0 : Integer.parseInt(getPage);

        String getSize = request.getParameter("size");
        int size = Objects.isNull(getSize) ? 4 : Integer.parseInt(getSize);

        String getCategory = request.getParameter("category");
        String category = Objects.isNull(getCategory) ? "" : getCategory;

        String getMonth = request.getParameter("month");
        String month = Objects.isNull(getMonth) ? "" : getMonth;

        String getTag = request.getParameter("tag");
        String tag = Objects.isNull(getTag) ? "" : getTag;

        long count = blogRepository.count();
        long pageTotal = (long) Math.ceil(count / size);

        List<BlogDTO> blogs = getAll();
        if (!keyword.isBlank()) {
            blogs = blogs.stream().filter(dto -> dto.getTitle().toLowerCase()
                    .contains(keyword.toLowerCase())).toList();
        }
        if (!category.isBlank()) {
            CategoriesBlogDTO getType = categoryBlogService.getByType(category);
            if (getType == null) {
                return "/error/notFound";
            }
            Long id = getType.getId();
            blogs = blogs.stream().filter(dto -> dto.getCategoryBlogId().equals(id)).toList();
        }
        if (!month.isBlank()) {
            blogs = blogs.stream().filter(dto -> dto.getCreatedMonth().toLowerCase().contains(month.toLowerCase())).toList();
        }
        if (!tag.isBlank()) {
            blogs = blogs.stream().filter(dto -> dto.getTags().stream().map(tagDTO -> tagDTO.getType().toLowerCase())
                    .toList().contains(tag.toLowerCase())).toList();
        }

        model.addAttribute("blog", blogs);
        model.addAttribute("tags", tagService.getAll());
        model.addAttribute("categoryForBlog", categoryBlogService.getAll());
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("pageTotal", pageTotal);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category", category);
        model.addAttribute("month", month);
        model.addAttribute("tag", tag);
        model.addAttribute("totalBlog", count);
        model.addAttribute("products", productService.topFeaturedProducts(3));
        return "blog";
    }

    @Override
    public String blogDetail(Long id, Model model, HttpServletRequest request) {
        String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");

        String category = request.getParameter("category") == null ? "" : request.getParameter("category");

        String month = request.getParameter("month") == null ? "" : request.getParameter("month");

        String tag = request.getParameter("tag") == null ? "" : request.getParameter("tag");

        List<CommentBlogDTO> comment = commentBlogService.getComment(id);
        Optional<BlogDTO> optional = getAll().stream().filter(dto -> dto.getId().equals(id)).findFirst();
        if (optional.isEmpty()) {
            return "/error/notFound";
        }
        model.addAttribute("blog", optional.get());
        model.addAttribute("totalBlog", blogRepository.count());
        model.addAttribute("categoryForBlog", categoryBlogService.getAll());
        model.addAttribute("category", category);
        model.addAttribute("month", month);
        model.addAttribute("keyword", keyword);
        model.addAttribute("tag", tag);
        model.addAttribute("tags", tagService.getAll());
        model.addAttribute("comments", comment);
        model.addAttribute("commentTotal", comment.stream().count());
        return "blog-detail";
    }
}
