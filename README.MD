# Basic DBMS indexing example using MySQL

# Preparation

The TPC-H Benchmark Tool is not included for licensing reasons. You have to download the tool from [http://tpc.org](http://www.tpc.org/tpc_documents_current_versions/current_specifications.asp) yourself and extract it to `./tools/dbgen`.

# Build
```
docker built -t mysql-indexing-tutorial .
```

# Run
## Using docker-compose (Recommended)
Start container:
```
docker-compose up
```
Start interactive shell for just created container
```
docker exec -ti `docker ps -ql`
```

# Working in the container

## Creating test data
```
/tools/bin/generate_data.sh
```

## Starting interactive MySQL session
```
$ mysql -uroot -p tpch
```
Create schema and import generated data
```
mysql> source /tools/dbgen/dss.dll
mysql> source /sql/load_data.sql
```
Enable profiling for detailed performance figures (optional)
```
SET PROFILING=1;
SHOW PROFILES;
SHOW PROFILE FOR QUERY <n>;
SET PROFILING_HISTORY_SIZE=0;
SET PROFILING_HISTORY_SIZE=1;
```
Run test query
```
source /sql/demo_query.sql
```
Create index
```
source /sql/create_index.sql
```
Run test query again
```
source /sql/demo_query.sql
```

