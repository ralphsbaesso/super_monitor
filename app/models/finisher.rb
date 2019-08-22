module Finisher
  def finished

    observed = Observed.find_by(object_id: self.id, class_name: self.class.name, status: :processing)
    if observed
      observed.status = :processed
      Observer.transaction do
        observer = Observer.find(observed.observer_id)
        observer.processed_count += 1;
        observer.save!
        observed.save!
      end
    end
  end
end