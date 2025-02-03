### Quiz Questions

Complete the Quiz shown below. It’s a set of 6 multiple-choice questions to test your understanding of workflow orchestration, Kestra and ETL pipelines for data lakes and warehouses.

1) Within the execution for `Yellow` Taxi data for the year `2020` and month `12`: what is the uncompressed file size (i.e. the output file `yellow_tripdata_2020-12.csv` of the `extract` task)?

Answer: 134.5 MB

2) What is the rendered value of the variable `file` when the inputs `taxi` is set to `green`, `year` is set to `2020`, and `month` is set to `04` during execution?

<!--
    file: "{{inputs.taxi}}_tripdata_{{trigger.date | date('yyyy-MM')}}.csv" 
    = "green_tripdata_2020-04.csv"
-->
Answer: `green_tripdata_2020-04.csv`

3) How many rows are there for the `Yellow` Taxi data for all CSV files in the year 2020?

<!--
    Query sum and totals per filename to check if complete

    SELECT filename, COUNT(*) AS count_rows
    FROM `zoomcamp.yellow_tripdata` 
    WHERE filename LIKE 'yellow_tripdata_2020-%'
    GROUP BY ROLLUP(filename)
    ORDER BY filename;
-->
Answer: 24,648,499

4) How many rows are there for the `Green` Taxi data for all CSV files in the year 2020?

<!--
    Query sum and totals per filename to check if complete

    SELECT filename, COUNT(*) AS count_rows
    FROM `zoomcamp.green_tripdata` 
    WHERE filename LIKE 'green_tripdata_2020-%'
    GROUP BY ROLLUP(filename)
    ORDER BY filename;
-->
Answer: 1,734,051

5) How many rows are there for the `Yellow` Taxi data for the March 2021 CSV file?

<!--
    SELECT COUNT(*) AS count_rows
    FROM `glass-effect-449806-u8.zoomcamp.yellow_tripdata` 
    WHERE filename LIKE 'yellow_tripdata_2021-03.csv';
-->
Answer: 1,925,152

6) How would you configure the timezone to New York in a Schedule trigger?

<!-- See docs: https://kestra.io/docs/workflow-components/triggers/schedule-trigger -->
Answer: `timezone: America/New_York`
