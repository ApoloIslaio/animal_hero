module StatesHelper
  def showState()
    select("state_id", State.all.pluck(:description, :id), {include_blank: 'Selecione'})
  end
end
