class QueriesFacade < ApplicationQuery
  def articles_by_person
    execute_query(load_query('day_one/task_1_1.sql'))
  end

  def count_articles_by_person
    execute_query(load_query('day_one/task_1_2.sql'))
  end

  def comment_count_by_person_in_each_article
    execute_query(load_query('day_one/task_2_1.sql'))
  end

  def articles_summary
    execute_query(load_query('day_one/task_2_2.sql'))
  end

  def articles_ordered_by_comments
    execute_query(load_query('day_one/task_2_3.sql'))
  end

  def top_commenter
    execute_query(load_query('day_one/task_extra_1.sql'))
  end

  def fetch_people_comment_by_article(title)
    execute_query(load_query('day_one/task_extra_2.sql'), [title])
  end
end
