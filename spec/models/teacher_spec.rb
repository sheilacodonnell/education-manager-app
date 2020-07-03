require "rails_helper"

describe Teacher do

  let!(:teacher) { Teacher.create(first_name: 'Albus', last_name: 'Dumbledore', email: 'ad@gmail.com') }

  describe '#available_class_periods' do
    context 'when the teacher has no subjects' do
      it 'returns all the class periods' do
        expect(teacher.available_class_periods).to eq([1, 2, 3, 4, 5, 6, 7, 8])
      end
    end

    context 'when the teacher has one class scheduled' do
      before {teacher.subjects << Subject.create(teacher: teacher, name: 'Math', class_period: 1)}
      it 'returns the available class periods' do
        expect(teacher.available_class_periods).to eq([2,3,4,5,6,7,8])
      end
    end
  end
end