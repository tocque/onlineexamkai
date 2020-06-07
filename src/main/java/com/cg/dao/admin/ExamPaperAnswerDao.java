package com.cg.dao.admin;

import com.cg.entity.admin.ExamPaperAnswer;

import java.util.List;
import java.util.Map;

/**
 * @program: OnlineExam->ExamPaperAnswerDao
 * @description: 试卷dao层
 * @author: sdlwsl
 * @create: 2020-04-13 22:49
 **/

public interface ExamPaperAnswerDao {

    /**
     * 试卷答题插入操作
     *
     * @param examPaperAnswer
     * @return
     */
    int add(ExamPaperAnswer examPaperAnswer);

    /**
     * 试卷答题更新操作
     *
     * @param examPaperAnswer
     * @return
     */
    int edit(ExamPaperAnswer examPaperAnswer);

    /**
     * 试卷答题信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<ExamPaperAnswer> findList(Map<String, Object> queryMap);

    /**
     * 删除试卷答题信息
     *
     * @param id
     * @return
     */
    int delete(Long id);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getTotal(Map<String, Object> queryMap);

    /**
     * 根据某个学生查询试卷答题信息
     *
     * @param queryMap
     * @return
     */
    List<ExamPaperAnswer> findListByUser(Map<String, Object> queryMap);

    /**
     * 提交答案操作
     *
     * @param examPaperAnswer
     * @return
     */
    int submitAnswer(ExamPaperAnswer examPaperAnswer);

}
