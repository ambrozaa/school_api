Student.destroy_all
SchoolClass.destroy_all
School.destroy_all

# Создание школ
school1 = School.create!(name: '1234')
school2 = School.create!(name: '1277')

# Создание классов
class1a = SchoolClass.create!(number: 10, letter: 'А', students_count: 0, school: school1)
class1b = SchoolClass.create!(number: 10, letter: 'Б', students_count: 0, school: school1)
class2a = SchoolClass.create!(number: 9, letter: 'А', students_count: 0, school: school2)
class2b = SchoolClass.create!(number: 9, letter: 'Б', students_count: 0, school: school2)

# Создание студентов
Student.create!(
  first_name: 'Иван',
  last_name: 'Иванов',
  surname: 'Иванович',
  class_id: class1a.number,
  school_id: school1.id
)

Student.create!(
  first_name: 'Мария',
  last_name: 'Петрова',
  surname: 'Ивановна',
  class_id: class1b.number,
  school_id: school1.id
)

Student.create!(
  first_name: 'Алексей',
  last_name: 'Сидоров',
  surname: 'Сидорович',
  class_id: class2a.number,
  school_id: school2.id
)

Student.create!(
  first_name: 'Ольга',
  last_name: 'Михайлова',
  surname: 'Михайловна',
  class_id: class2b.number,
  school_id: school2.id
)



puts "Данные занесены в базу данных."