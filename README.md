## GoSpotCheck ps-code-challenge

#### This challenge was completed using PostgreSQL version 12.1 and Rails 5.2.4.1

### Post Code Info View

* I was able to verify the post_code_info view by comparing queries run on both the street_cafes table, and the post code info view and then comparing the return values.

```
CREATE VIEW post_code_info
              AS
              WITH summary AS (
                SELECT
                    c.post_code,
                    c.number_of_chairs,
                    c.name,
                    ROW_NUMBER() OVER(PARTITION BY c.post_code ORDER BY c.number_of_chairs DESC) as ck
                 FROM street_cafes c)
              SELECT s.post_code, agg_tbl.total_places, agg_tbl.total_chairs, agg_tbl.chairs_pct, s.name as place_with_max_chairs, s.number_of_chairs as max_chairs
              FROM summary s
              INNER JOIN (SELECT post_code,
                                   SUM(number_of_chairs) as total_chairs,
                                   CAST((CAST(sum(street_cafes.number_of_chairs) as Float) / CAST((SELECT SUM(number_of_chairs) FROM street_cafes) as Float) * 100) as DECIMAL(10,2)) as chairs_pct,
                                   count(street_cafes.post_code) as total_places
                                   FROM street_cafes GROUP BY post_code) agg_tbl ON (agg_tbl.post_code = s.post_code)
              WHERE s.ck = 1;
```

The Rails script to categorize street cafes was written in a rake task, it can be executed by running 'rake categorize:street_cafes'

The rake task is tested on the unit and integration levels. The specific methods used are tested in '/spec/models/street_cafe_spec.rb' and the integration test is located in 'spec/tasks/rake_tasks_spec.rb'

For the view that aggregates cafe records by category, the SQL Query is listed below and can be migrated to the database after importing the street cafe csv, and then running the 'categorize:street_cafes' rake task.

```
CREATE VIEW categories_info
              AS
                SELECT street_cafes.category              AS category,
                       Count(street_cafes.post_code)      AS total_places,
                       Sum(street_cafes.number_of_chairs) AS total_chairs
                FROM   street_cafes
                GROUP  BY street_cafes.category;
```

For the final two scripts. They can be run using the 'export_and_delete:small_street_cafes' and 'concatenate:med_and_large_cafe_names'

Both scripts are tested at unit and integration levels. The methods used are class methods. Located in '/spec/models/street_cafe_spec.rb' and they are tested at the integration level located in 'spec/tasks/rake_tasks_spec.rb'
