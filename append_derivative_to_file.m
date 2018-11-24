%append foot one, foot 2, derivative foot 1, derivative foot 2
%all data filtered with median filter and normalized
als1 = [als11',als21',alsder11',alsder21'];
als2 = [als12',als22',alsder12',alsder22'];
als3 = [als13',als23',alsder13',alsder23'];
als4 = [als14',als24',alsder14',alsder24'];
als5 = [als15',als25',alsder15',alsder25'];
als6 = [als16',als26',alsder16',alsder26'];
als7 = [als17',als27',alsder17',alsder27'];
als8 = [als18',als28',alsder18',alsder28'];
control1 = [cntl11',cntl21',cntlder11',cntlder21'];
control2 = [cntl12',cntl22',cntlder12',cntlder22'];
control3 = [cntl13',cntl23',cntlder13',cntlder23'];
control4 = [cntl14',cntl24',cntlder14',cntlder24'];
control5 = [cntl15',cntl25',cntlder15',cntlder25'];
control6 = [cntl16',cntl26',cntlder16',cntlder26'];
control7 = [cntl17',cntl27',cntlder17',cntlder27'];
control8 = [cntl18',cntl28',cntlder18',cntlder28'];
control14 = [cntl114',cntl214',cntlder114',cntlder214'];
control15 = [cntl115',cntl215',cntlder115',cntlder215'];
control16 = [cntl116',cntl216',cntlder116',cntlder216'];
hunt1 = [hunt11',hunt21',huntder11',huntder21'];
hunt2 = [hunt12',hunt22',huntder12',huntder22'];
hunt3 = [hunt13',hunt23',huntder13',huntder23'];
hunt4 = [hunt14',hunt24',huntder14',huntder24'];
hunt5 = [hunt15',hunt25',huntder15',huntder25'];
hunt6 = [hunt16',hunt26',huntder16',huntder26'];
hunt7 = [hunt17',hunt27',huntder17',huntder27'];
hunt8 = [hunt18',hunt28',huntder18',huntder28'];
hunt14 = [hunt114',hunt214',huntder114',huntder214'];
hunt15 = [hunt115',hunt215',huntder115',huntder215'];
hunt16 = [hunt116',hunt216',huntder116',huntder216'];
hunt17 = [hunt117',hunt217',huntder117',huntder217'];
hunt18 = [hunt118',hunt218',huntder118',huntder218'];
hunt19 = [hunt119',hunt219',huntder119',huntder219'];
hunt20 = [hunt120',hunt220',huntder120',huntder220'];
park1 = [park11',park21',parkder11',parkder21'];
park2 = [park12',park22',parkder12',parkder22'];
park3 = [park13',park23',parkder13',parkder23'];
park4 = [park14',park24',parkder14',parkder24'];
park5 = [park15',park25',parkder15',parkder25'];
park6 = [park16',park26',parkder16',parkder26'];
park7 = [park17',park27',parkder17',parkder27'];
park8 = [park18',park28',parkder18',parkder28'];
park14 = [park114',park214',parkder114',parkder214'];
park15 = [park115',park215',parkder115',parkder215'];

folder = 'data/'

%write to tsv
dlmwrite('data/als1.tsv',als1)
dlmwrite('data/als2.tsv',als2)
dlmwrite('data/als3.tsv',als3)
dlmwrite('data/als4.tsv',als4)
dlmwrite('data/als5.tsv',als5)
dlmwrite('data/als6.tsv',als6)
dlmwrite('data/als7.tsv',als7)
dlmwrite('data/als8.tsv',als8)
dlmwrite('data/control1.tsv',control1)
dlmwrite('data/control2.tsv',control2)
dlmwrite('data/control3.tsv',control3)
dlmwrite('data/control4.tsv',control4)
dlmwrite('data/control5.tsv',control5)
dlmwrite('data/control6.tsv',control6)
dlmwrite('data/control7.tsv',control7)
dlmwrite('data/control8.tsv',control8)
dlmwrite('data/control14.tsv',control14)
dlmwrite('data/control15.tsv',control15)
dlmwrite('data/control16.tsv',control16)
dlmwrite('data/hunt1.tsv',hunt1)
dlmwrite('data/hunt2.tsv',hunt2)
dlmwrite('data/hunt3.tsv',hunt3)
dlmwrite('data/hunt4.tsv',hunt4)
dlmwrite('data/hunt5.tsv',hunt5)
dlmwrite('data/hunt6.tsv',hunt6)
dlmwrite('data/hunt7.tsv',hunt7)
dlmwrite('data/hunt8.tsv',hunt8)
dlmwrite('data/hunt14.tsv',hunt14)
dlmwrite('data/hunt15.tsv',hunt15)
dlmwrite('data/hunt16.tsv',hunt16)
dlmwrite('data/hunt17.tsv',hunt17)
dlmwrite('data/hunt18.tsv',hunt18)
dlmwrite('data/hunt19.tsv',hunt19)
dlmwrite('data/hunt20.tsv',hunt20)
dlmwrite('data/park1.tsv',park1)
dlmwrite('data/park2.tsv',park2)
dlmwrite('data/park3.tsv',park3)
dlmwrite('data/park4.tsv',park4)
dlmwrite('data/park5.tsv',park5)
dlmwrite('data/park6.tsv',park6)
dlmwrite('data/park7.tsv',park7)
dlmwrite('data/park8.tsv',park8)
dlmwrite('data/park14.tsv',park14)
dlmwrite('data/park15.tsv',park15)