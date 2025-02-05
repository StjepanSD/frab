class InstallActsAsAudited < ActiveRecord::Migration[5.1]
  def self.up
    create_table :audits, force: true do |t|
      t.column :auditable_id, :integer
      t.column :auditable_type, :string
      t.column :association_id, :integer
      t.column :association_type, :string
      t.column :user_id, :integer
      t.column :user_type, :string
      t.column :username, :string
      t.column :action, :string
      t.column :audited_changes, :text
      t.column :version, :integer, default: 0
      t.column :comment, :string
      t.column :remote_address, :string
      t.column :created_at, :datetime
    end

    add_index :audits, [:auditable_id, :auditable_type], name: 'auditable_index'
    add_index :audits, [:association_id, :association_type], name: 'association_index'
    add_index :audits, [:user_id, :user_type], name: 'user_index'
    add_index :audits, :created_at
  end

  def self.down
    drop_table :audits
  end
end
