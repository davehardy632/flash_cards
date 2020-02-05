## GoSpotCheck ps-code-challenge

#### This challenge was completed using PostgreSQL version 12.1 and Rails 5.2.4.1

### Post Code Info View

*I was able to verify the post_code_info view by comparing queries run on both the street_cafes table, and the post code info view and then comparing the return values.*


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

### Categorizing Street Cafes Based on Post Code Prefix and Number of Chairs

Methods Used

 ```with_post_code_prefix()``` 

 ```categorize_LS1_cafes```

 ```categorize_LS2_cafes```

 ```categorize_post_code_outliers```

*The script I used to categorize street cafes is tested on unit and integration levels.*

Unit Testing

..* /spec/models/street_cafe_spec.rb

Integration Testing

..* spec/tasks/rake_tasks_spec.rb

### Categories Info View
*The SQL used to create this view can be found below.*

```
CREATE VIEW categories_info
              AS
                SELECT street_cafes.category              AS category,
                       Count(street_cafes.post_code)      AS total_places,
                       Sum(street_cafes.number_of_chairs) AS total_chairs
                FROM   street_cafes
                GROUP  BY street_cafes.category;
```


