require "rails_helper"

describe Subject do

  let!(:teacher) { Teacher.create(first_name: 'Albus', last_name: 'Dumbledore', email: 'ad@gmail.com') }
  let!(:student) {Student.create(first_name: 'Harry', last_name: 'Potter')}
  let!(:student2) {Student.create(first_name: 'Ron', last_name: 'Weasley')}
  let!(:subject) { Subject.create(teacher: teacher, name: 'Math', class_period: 1) }

  describe '#available_students?' do
    context 'when all students are available that class period' do
      it 'returns the students' do
        expect(subject.available_students).to eq([student, student2])
      end

      context 'when there is one student available' do
        before {student.subjects << subject}
        it 'returns the available student' do
          expect(subject.available_students).to eq([student2])
        end
      end

      context 'when there are no students available' do
        before { student.subjects << subject }
        before { student2.subjects << subject }
        it 'returns no students' do
          expect(subject.available_students).to be_empty
        end
      end
    end
  end
end