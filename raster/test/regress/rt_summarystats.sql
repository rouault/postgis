SELECT
	count,
	round(sum::numeric, 3),
	round(mean::numeric, 3),
	round(stddev::numeric, 3),
	round(min::numeric, 3),
	round(max::numeric, 3)
FROM ST_SummaryStats(
	ST_SetValue(
		ST_SetValue(
			ST_SetValue(
				ST_AddBand(
					ST_MakeEmptyRaster(10, 10, 10, 10, 2, 2, 0, 0,-1)
					, 1, '64BF', 0, 0
				)
				, 1, 1, 1, -10
			)
			, 1, 5, 4, 0
		)
		, 1, 5, 5, 3.14159
	)
	, TRUE
);
SELECT count FROM ST_SummaryStats(
	ST_SetValue(
		ST_SetValue(
			ST_SetValue(
				ST_AddBand(
					ST_MakeEmptyRaster(10, 10, 10, 10, 2, 2, 0, 0,-1)
					, 1, '64BF', 0, 0
				)
				, 1, 1, 1, -10
			)
			, 1, 5, 4, 0
		)
		, 1, 5, 5, 3.14159
	)
	, TRUE
);
SELECT count FROM ST_SummaryStats(
	ST_SetValue(
		ST_SetValue(
			ST_SetValue(
				ST_AddBand(
					ST_MakeEmptyRaster(10, 10, 10, 10, 2, 2, 0, 0,-1)
					, 1, '64BF', 0, 0
				)
				, 1, 1, 1, -10
			)
			, 1, 5, 4, 0
		)
		, 1, 5, 5, 3.14159
	)
	, FALSE
);
SELECT round(mean::numeric, 3), round(stddev::numeric, 3) FROM ST_SummaryStats(
	ST_SetValue(
		ST_SetValue(
			ST_SetValue(
				ST_AddBand(
					ST_MakeEmptyRaster(10, 10, 10, 10, 2, 2, 0, 0,-1)
					, 1, '64BF', 0, 0
				)
				, 1, 1, 1, -10
			)
			, 1, 5, 4, 0
		)
		, 1, 5, 5, 3.14159
	)
	, TRUE
);
SELECT round(mean::numeric, 3), round(stddev::numeric, 3) FROM ST_SummaryStats(
	ST_SetValue(
		ST_SetValue(
			ST_SetValue(
				ST_AddBand(
					ST_MakeEmptyRaster(10, 10, 10, 10, 2, 2, 0, 0,-1)
					, 1, '64BF', 0, 0
				)
				, 1, 1, 1, -10
			)
			, 1, 5, 4, 0
		)
		, 1, 5, 5, 3.14159
	)
	, FALSE
);
BEGIN;
CREATE TEMP TABLE test
	ON COMMIT DROP AS
	SELECT
		rast.rast
	FROM (
		SELECT ST_SetValue(
			ST_SetValue(
				ST_SetValue(
					ST_AddBand(
						ST_MakeEmptyRaster(10, 10, 10, 10, 2, 2, 0, 0,-1)
						, 1, '64BF', 0, 0
					)
					, 1, 1, 1, -10
				)
				, 1, 5, 4, 0
			)
			, 1, 5, 5, 3.14159
		) AS rast
	) AS rast
	FULL JOIN (
		SELECT generate_series(1, 10) AS id
	) AS id
		ON 1 = 1;
SELECT
	count,
	round(sum::numeric, 3),
	round(mean::numeric, 3),
	round(stddev::numeric, 3),
	round(min::numeric, 3),
	round(max::numeric, 3)
FROM ST_SummaryStats('test', 'rast', 1, TRUE);
SELECT
	count,
	round(sum::numeric, 3),
	round(mean::numeric, 3),
	round(stddev::numeric, 3),
	round(min::numeric, 3),
	round(max::numeric, 3)
FROM ST_SummaryStats('test', 'rast', 1, FALSE);
SELECT
	count,
	round(sum::numeric, 3),
	round(mean::numeric, 3),
	round(stddev::numeric, 3),
	round(min::numeric, 3),
	round(max::numeric, 3)
FROM ST_SummaryStats('test', 'rast', 1);
SELECT
	count,
	round(sum::numeric, 3),
	round(mean::numeric, 3),
	round(stddev::numeric, 3),
	round(min::numeric, 3),
	round(max::numeric, 3)
FROM ST_SummaryStats('test', 'rast');
ROLLBACK;
