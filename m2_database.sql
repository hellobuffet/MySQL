create database if not exists db01; -- v新增資料庫db01
CREATE SCHEMA `db02` ;

use db02;
show character set;
show collation like '%big5%';-- 查詢排序的選項

-- ctrl+enter，執行單排
-- ctrl+shift+enter，執行全部

alter database db02
character set big5
collate big5_bin; -- 改db02的字元集為big5的big5_bin

-- ai是指accent insensitive


select @@character_set_database, @@collation_database; -- 查詢當前資料庫的字元型態
drop database db02; -- 刪除db02

