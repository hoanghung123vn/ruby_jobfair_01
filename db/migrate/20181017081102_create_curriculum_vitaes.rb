class CreateCurriculumVitaes < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculum_vitaes do |t|
      t.text :target
      t.string :skill
      t.string :level
      t.text :experience
      t.string :language
      t.string :note

      t.timestamps
    end
  end
end
