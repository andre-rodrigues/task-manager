require "rails_helper"

RSpec.describe TaskParser do

  describe ".parse" do
    let(:valid_task_input) { "Estudar tecnologias 30 minutos" }
    let!(:persisted_task) do
        Task.create(
          start_at: Time.current,
          end_at: 10.minutes.from_now,
          description: "Teste de 10 minutos"
        )
      end

    subject { described_class.parse(valid_task_input) }

    it "returns a new Task" do
      expect(subject).to be_a Task
      expect(subject).not_to be_persisted
    end

    it "identifies the duration" do
      expect(subject.duration).to eq 30.minutes.to_f
    end

    it "sets the start time to the first available period of the day" do
      expect(subject.start_at.to_i).to eq persisted_task.end_at.to_i
    end

    context "when time is given" do
      it "sets the end time according to the duration" do
        expect(subject.end_at).to eq (subject.start_at + subject.duration)
      end
    end

    context "when time is not given" do
      let(:valid_task_input) { "Estudar tecnologias" }

      it "has no duration" do
        expect(subject.duration).to eq 0
      end
    end
  end
end