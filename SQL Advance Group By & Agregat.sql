SELECT
    *
FROM
    ds.studentsperformance;

-- 1. jumlah record pada dataset
SELECT
    count(*)
FROM
    ds.studentsperformance;

-- 2.a. perbandingan rata-rata nilai reading laki-laki dan perempuan
SELECT
    gender,
    AVG(reading_score) AS avg_reading_score
FROM
    ds.studentsperformance
GROUP BY
    gender;

-- 2.b. nilai math tertinggi dan terendah dari masing-masing tingkatan pendidikan orangtua (parental level of education)
SELECT
    parental_level_of_education,
    MAX(math_score),
    MIN(math_score)
FROM
    ds.studentsperformance
GROUP BY
    parental_level_of_education
ORDER BY
    parental_level_of_education;

-- 3. nilai rata-rata dari math, reading dan writing orang bergender perempuan yang pernah menyelesaikan kursus persiapan ujian (test_preparation_course)
SELECT
    gender,
    test_preparation_course,
    AVG(math_score),
    AVG(reading_score),
    AVG(writing_score)
FROM
    ds.studentsperformance
WHERE
    gender = 'female'
    AND test_preparation_course = 'completed';

-- 4. nilai rata-rata writing orang yang memiliki orangtua yang tingkat pendidikannya adalah high school/some high school? (digabung, tidak terpisah)
SELECT
    AVG(writing_score) AS avg_writing_score
FROM
    ds.studentsperformance
WHERE
    parental_level_of_education LIKE '%high school%';

-- 5. rangkuman statistik rata-rata nilai math, reading, dan writing berdasarkan jenis kelamin, kelompok etnis, dan apakah siswa mengambil kursus persiapan ujian atau tidak.
SELECT
    gender,
    race_or_ethnicity,
    test_preparation_course,
    AVG(math_score) AS avg_math_score,
    AVG(reading_score) AS avg_reading_score,
    AVG(writing_score) AS avg_writing_score
FROM
    ds.studentsperformance
GROUP BY
    gender,
    race_or_ethnicity,
    test_preparation_course
ORDER BY
    gender,
    race_or_ethnicity,
    test_preparation_course;

-- 6. Berdasarkan hasil output case nomor 5, modifikasi query tersebut untuk menunjukkan data yang memiliki nilai rata-rata math lebih besar dari 70
SELECT
    gender,
    race_or_ethnicity,
    test_preparation_course,
    AVG(math_score) AS avg_math_score,
    AVG(reading_score) AS avg_reading_score,
    AVG(writing_score) AS avg_writing_score
FROM
    ds.studentsperformance
GROUP BY
    gender,
    race_or_ethnicity,
    test_preparation_course
HAVING
    avg_math_score > 70
ORDER BY
    gender,
    race_or_ethnicity,
    test_preparation_course;