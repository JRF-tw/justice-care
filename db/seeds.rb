# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


reset = true

if reset

  problems = [
    {
      id: 1,
      title: '法官判決與一般大眾的期待有落差',
      content: '<p>2010年，連續幾件幼女性侵案件，法院都認定「沒有違反當事人意願」，爆發了白玫瑰運動，凱達格蘭大道上數千人身著黑衣，手上拿著白玫瑰，齊聲發出怒吼「司法配不上純潔的小孩」。2015年˙，台灣人民赫然˙發現已經吃進不曉得幾噸的餿水油，頂新魏家6名被告一審全數安全下莊，好多民眾氣得大罵法院根本是「有錢判生、無錢判死」。法院代表國家，獨立行使審判權力，可是在這些攸關兒保、食安的案件時，法院的判決卻讓一般大眾懷疑，法官完全沒有生活常識，或者根本刻意包庇有權有勢的人。</p>',
      link: ''
    }, {
      id: 2,
      title: '司法誤判造成當事人二度傷害',
      content: '<p>對司法來說，作出妥當正確的判斷是非常重要的事情。但是這件事就像遙不可及的夢想。部分案件當事人會覺得法官的裁判、檢察官的起訴或不起訴等等弄錯了事實、誤用了法條，遇到事情要上法庭已經夠倒楣了，還遇到誤判更是造成當事人二度傷害。</p>
      <p>例如東海之狼性侵案，紀富仁被警方懷疑涉案，就被踩下體逼著自白，又被逼著下跪跟被害人求婚，檢方並將他起訴求處死刑。後來在紀富仁被羈押的期間，又有一件性侵案發生，DNA鑑定的結果和東海之狼性侵案嫌犯的DNA一致，才發現搞錯人了，真犯人是一位海巡士官長。</p>',
      link: ''
    }, {
      id: 3,
      title: '遇到官司民眾常不知該怎麼辦',
      content: '<p>遇到了官司該怎麼辦？很多人覺得自己行得正，事情不會發生在我身上，但是真的很難說，或許是不小心發生車禍、與鄰居間發生爭執、公務人員工作時發生了某些疏失，或是參加街頭抗議活動等等的，官司都有可能就此造訪。一般人沒有訴訟經驗，突然遇到了，很可能就慌了手腳、心情大亂，無頭蒼蠅般地打聽該怎麼應對...</p>',
      link: ''
    }, {
      id: 4,
      title: '被害人的權益不被司法重視',
      content: '<p>有些人認為，台灣的司法重視加害人權益的保護，卻不太關心被害人與家屬的處境。</p>
      <p>例如小女孩遭到性侵之後，由社工和警察一起詢問案情。但是由於社工和警察的問話技巧等等的問題(例如誘導或是不當的鼓勵)，導致小女孩的證詞被質疑遭到大人問話方式的汙染，後來小女孩就因此一再被要求出庭接受問話。對小女孩及她的親人都是折磨。</p>
      <p>又例如自己的親人遭到殺害，身為被害人遺族才發現自己在法律上不太有地位。如果檢察官認為死者不是他殺而是自殺，作出不起訴或是直接結案，被害人家屬很可能拿不到相關的偵查資料。好不容易檢察官起訴了，才發現法院開庭問被告，自己不見得會被通知；認為有些重要證據要調查，法官或檢察官也不一定會理會，想抗議又不知該如何抗議。</p>',
      link: ''
    }
  ]

  Problem.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(Problem.table_name)

  problems.each do |p|
    problem = Problem.new(p)
    problem.id = p[:id]
    problem.save
  end
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end