module Notable
  extend ActiveSupport::Concern

  included do
    has_many :notes, as: :notable
  end

  # メソッド内でクラスごとの分岐を書かない。
  # インターフェースを定義し、各クラスで処理を実装する。
  # polymorphicなので、note_obj.notable.note_title というふうにクラスを気にすることなく呼び出すことができる。
  def note_title
    raise NotImplementedError
  end
end