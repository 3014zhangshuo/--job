class AddAasmStateToApply < ActiveRecord::Migration[5.0]
  def change
    add_column :applies, :aasm_state, :string, default: "apply_sended"
    add_index  :applies, :aasm_state
  end
end
