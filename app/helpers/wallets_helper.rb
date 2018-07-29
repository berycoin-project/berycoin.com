module WalletsHelper
  def is_payout?
    current_user.vests.first.expire_at < DateTime.now
  end
  def is_vest_empty?
    current_user.vests.first.balance <= 0
  end
  def get_rank(amount)
    @ranks = Rank.all
    $current_rank = Rank.find_by_name("peridoto")
    @ranks.each do |rank|
      if amount >= rank.value.to_f
        $current_rank = rank
      end
    end
    $current_rank
  end
end
