# feather dataformat格式的cli

编写python package项目，可以通过pip安装，安装后提供feather_cli命令，支持解析读取feather dataforamt的数据。

其中读取操作使用依赖dependency pyarrow包。

## 主要功能

支持命令包括:

1. feather_cli <input file>
读取指定文件的metadata并格式化输出信息到terminal
参考输出格式: 
```
<pyarrow._parquet.FileMetaData object at 0x1014879a8>
created_by: parquet-mr version 1.8.1 (build 4aba4dae7bb0d4edbcf7923ae1339f28fd3f7fcf)
num_columns: 13
num_rows: 1000
num_row_groups: 1
format_version: 1.0
serialized_size: 1125
```
2. feather_cli <input file> --schema
读取指定文件的schema并输出在terminal
参考输出格式:
```
<pyarrow._parquet.ParquetSchema object at 0x1048b9a88>
registration_dttm: INT96
id: INT32
name: BYTE_ARRAY UTF8
email: BYTE_ARRAY UTF8
...
ip_address: BYTE_ARRAY UTF8
country: BYTE_ARRAY UTF8
```
3. feather_cli <input file> --count
读取指定文件并输出包含的总数据记录数
参考输出格式:
```
1024
```

4. feather_cli <input file> --head N --format table/markdown/csv
输出指定文件的前N行数据, 支持指定格式，如果未指定，则默认使用table。其中table/markdown使用python的tabulate库输出
参考输出格式:
```
+-------------+-----+-------------+
| Name        | Age | City        |
+-------------+-----+-------------+
| John Doe    |  30 | New York    |
| Jane Smith  |  25 | Los Angeles |
| Emily Jones |  35 | Chicago     |
+-------------+-----+-------------+
```

5. feather_cli <input file> --tail N --format table/markdown/csv
输出指定文件的最后N行数据, 支持指定格式，如果未指定，则默认使用table。其中table/markdown使用python的tabulate库输出
参考输出格式和输出前N行一样.



## 非功能性诉求
1. 支持--help展示用法
2. 做好错误处理，如：文件格式识别错误或者文件不存在等问题，打印对应错误日志
3. 做好项目初始化，方便后续开源开发，包括requirements.txt等
4. 创建打包发布到pip的脚本，并创建setup.py脚本用于初始化
5. python版本支持为3.x
6. 创建单元测试 放到tests目录下




