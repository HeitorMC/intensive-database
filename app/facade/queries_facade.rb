class QueriesFacade < ApplicationQuery
  def articles_by_person
    execute_query(load_query('day_one/task_1_1.sql'))
  end

  def count_articles_by_person
    execute_query(load_query('day_one/task_1_2.sql'))
  end
end
