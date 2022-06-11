class CreateSupportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :support_requests do |t|
      t.string :email
      t.string :subject, comment: "email subject"
      t.text :body, comment: "email body"

      t.belongs_to :order, foreign_key: true, comment: "Last Order if applicable"
      t.timestamps
    end
  end
end
