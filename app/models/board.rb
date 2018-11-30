class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy

  def self.all_boards(user_id)
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b
      WHERE b.user_id = #{user_id}"
    )
  end

  def self.create_board(p, id)
    Board.find_by_sql(["
      INSERT INTO boards (name, user_id)
      VALUES (:name, :user_id);
    ", {
      name: p[:name],
      user_id: id
    }])
  end
  
  def self.update_board(board_id, p)
    Board.find_by_sql(["
      UPDATE boards AS c
      SET first_name = ?, last_name = ?, email = ?, phone = ?, updated_at = ?
      WHERE c.id = ?
    ;", p[:first_name], p[:last_name], p[:email], p[:phone], DateTime.now, board_id])
  end
  
  def self.delete_board(board_id)
    Board.find_by_sql(["
      DELETE FROM boards AS c
      WHERE c.id = ?
    ;", board_id])
  end





end
