class CreateUserCurriculumVitaes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_curriculum_vitaes do |t|
      t.references :user, foreign_key: true
      t.references :curriculum_vitae, foreign_key: true

      t.timestamps
    end
  end
end
