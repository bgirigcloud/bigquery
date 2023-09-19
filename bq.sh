#Task 1. Examine a table

bq show bigquery-public-data:samples.shakespeare

#Task 2. Run the help command
bq help query

#Task 3. Run a query
bq query --use_legacy_sql=false \
'SELECT
   word,
   SUM(word_count) AS count
 FROM
   `bigquery-public-data`.samples.shakespeare
 WHERE
   word LIKE "%raisin%"
 GROUP BY
   word'
#3.1
bq query --use_legacy_sql=false \
'SELECT
   word
 FROM
   `bigquery-public-data`.samples.shakespeare
 WHERE
   word = "huzzah"'

#Task 4. Create a new table
bq ls
bq ls bigquery-public-data:
bq mk babynames
bq ls
#pload the dataset
curl -LO http://www.ssa.gov/OACT/babynames/names.zip
ls
unzip names.zip
ls
#Create your table
bq load babynames.names2010 yob2010.txt name:string,gender:string,count:integer

bq ls babynames

#Run bq show and your dataset.table to see the schema

bq show babynames.names2010
#Task 5. Run queries
bq query "SELECT name,count FROM babynames.names2010 WHERE gender = 'F' ORDER BY count DESC LIMIT 5"

#Run the following command to see the top 5 most unusual boys names:

bq query "SELECT name,count FROM babynames.names2010 WHERE gender = 'M' ORDER BY count ASC LIMIT 5"

#Task 7. Clean up
bq rm -r babynames

