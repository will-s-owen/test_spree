Property.class_eval do
  scope :name_equals, lambda { |name| where("name = ?", name) }
end
