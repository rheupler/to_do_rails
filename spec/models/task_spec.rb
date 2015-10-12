require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  it 'returns the not done tasks' do
    not_done_task1 = Task.create({:description => 'gotta do it', :done => false})
    not_done_task2 = Task.create({:description => 'gotta do it too', :done => false})
    not_done_tasks = [not_done_task1, not_done_task2]
    done_task = Task.create({:description => 'done', :done => true})
    expect(Task.not_done()).to(eq(not_done_tasks))
  end
end
