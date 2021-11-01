class AttachedFilePresenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'imageが選択されていません') unless value.attached?
  end
end
