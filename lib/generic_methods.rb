module GenericMethods
  private
  def normalize_name
    unless name.nil?
      self.name = name.strip
      self.name = name.gsub(%r{[-_]}, ' ')
    end
  end
end
