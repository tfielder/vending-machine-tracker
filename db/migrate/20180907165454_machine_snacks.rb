class MachineSnacks < ActiveRecord::Migration[5.1]
  def change
    add_reference :machinesnacks, :machine, foreign_key: true
    add_reference :machinesnacks, :snack, foreign_key: true
  end
end
