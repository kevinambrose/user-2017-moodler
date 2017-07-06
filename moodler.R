# Connect to the databse ----
# ===========================

.con = DBI::dbConnect(
  RMySQL::MySQL(),
  password = "moodler", username = "moodler", dbname = "moodle",
  host = "127.0.0.1"
)

# Explore database ----
# =====================

library(moodler)
get_courses(.con) # courses
get_course_modules(.con, course.id = 2) # modules in a course

# Extract quiz data ----
# ======================

q = get_quiz(.con, 101)
q

# Get item data

qd = get_module_data(q)
qd

# Export answers - useful for item analysis

qitems = quiz_items(qd, question.type = "multichoice_one")
head(qitems)

qkey = quiz_key(qd, question.type = "multichoice_one")
qkey

# Analyse quiz data using, eg., mirt

mod = mirt::mirt(qitems, 1)
mirt::itemplot(mod, 2)

