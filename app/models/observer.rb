class Observer < ApplicationRecord
  has_many :observeds, autosave: true, dependent: :delete_all

  def self.start(entities, **options)
    class_list = Set.new(entities.map { |entity| entity.class.name })
    observer = self.create!(class_list: class_list.map{ |name| name }, processes_count: entities.count, status: :processing, date: Date.today)

    entities.each do |entity|
      entity.save! unless entity.id
      observer.observeds.create!(class_name: entity.class.name, object_id: entity.id, status: :processing)
    end

    Thread.new do
      while observer.processes_count != observer.processed_count
        puts 'Executando OBSERVER!'
        sleep options[:time] || 1
        observer.reload
      end
      observer.status = :processed
      observer.save!

      yield if block_given?
      Thread.exit
    end
  end
end
