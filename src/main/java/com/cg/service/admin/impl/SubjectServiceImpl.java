package com.cg.service.admin.impl;

import com.cg.dao.admin.SubjectDao;
import com.cg.entity.admin.Subject;
import com.cg.service.admin.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @description: 学科专业service实现类
 * @author: sdlwsl
 **/
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    SubjectDao subjectDao;

    @Override
    public int add(Subject subject) {
        return subjectDao.add(subject);
    }

    @Override
    public int edit(Subject subject) {
        return subjectDao.edit(subject);
    }

    @Override
    public List<Subject> findList(Map<String, Object> queryMap) {
        return subjectDao.findList(queryMap);
    }

    @Override
    public int delete(Long id) {
        return subjectDao.delete(id);
    }

    @Override
    public Integer getTotal(Map<String, Object> queryMap) {
        return subjectDao.getTotal(queryMap);
    }

    @Override
    public Subject findById(Long id) {
        return subjectDao.findById(id);
    }
}
