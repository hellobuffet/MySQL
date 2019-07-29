-- 1. 查询" 01 "课程比" 02 "课程成绩高的学生的信息及课程分数
SELECT SC.SId, ST.Sname, ST.Sage, ST.Ssex, C.CId, SC.score
FROM 	SC JOIN Student AS ST ON SC.SId = ST.SId
		   JOIN	Course 	AS C  ON SC.CId = C.CId;
