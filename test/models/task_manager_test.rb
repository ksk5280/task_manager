require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_task
    data = {
      title:       "some title",
      description: "some description"
    }

    task_manager.create(data)
    task = task_manager.all.last

    assert task.id
    assert_equal "some title", task.title
    assert_equal "some description", task.description
  end

  def test_can_get_all_tasks
    data1 = {
      title:       "some title",
      description: "some description"
    }
    task_manager.create(data1)

    data2 = {
      title:       "another title",
      description: "another description"
    }
    task_manager.create(data2)

    tasks = task_manager.all

    assert_equal Task, tasks.sample.class
    assert_equal 2, tasks.count
    assert_equal "some title", tasks[0].title
    assert_equal "another title", tasks[1].title
    assert_equal "some description", tasks[0].description
    assert_equal "another description", tasks[1].description
  end

  def test_finds_task_by_id
    data1 = {
      title:       "some title",
      description: "some description"
    }
    task_manager.create(data1)

    data2 = {
      title:       "another title",
      description: "another description"
    }
    task_manager.create(data2)

    task1 = task_manager.find(1)
    task2 = task_manager.find(2)

    assert_equal "some title", task1.title
    assert_equal "another title", task2.title
    assert_equal "some description", task1.description
    assert_equal "another description", task2.description
  end

  def test_updates_existing_task_data
    data1 = {
      title:       "some title",
      description: "some description"
    }
    task_manager.create(data1)
    task = task_manager.find(1)

    assert_equal "some title", task.title
    assert_equal "some description", task.description

    data2 = {
      title:       "another title",
      description: "another description"
    }
    task_manager.update(data2, 1)
    task = task_manager.find(1)

    assert_equal "another title", task.title
    assert_equal "another description", task.description
  end

  def test_can_delete_tasks_from_id
    data1 = {
      title:       "some title",
      description: "some description"
    }
    task_manager.create(data1)

    data2 = {
      title:       "another title",
      description: "another description"
    }
    task_manager.create(data2)

    tasks = task_manager.all
    assert_equal 2, tasks.count
    assert_equal "some title", tasks[0].title
    assert_equal "some description", tasks[0].description
    
    task_manager.delete(1)
    tasks = task_manager.all
    assert_equal 1, tasks.count
    assert_equal "another title", tasks[0].title
    assert_equal "another description", tasks[0].description
  end

  # def task_creater
  #   data1 = {
  #     title:       "some title",
  #     description: "some description"
  #   }
  #   task_manager.create(data1)
  #
  #   data2 = {
  #     title:       "another title",
  #     description: "another description"
  #   }
  #   task_manager.create(data2)
  # end
end
