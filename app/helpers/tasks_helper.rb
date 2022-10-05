module TasksHelper
  def field_update(old_version, new_version)
    old_version == new_version ? "Left the old version" : new_version
  end
end
