source_path
derivative_feature
%append foot one, foot 2, derivative foot 1, derivative foot 2,
%maxfreqfoot1,maxfreqfoot2, indexmaxfreqfoot1, indexmaxfreqfoot2 
%all data filtered with median filter and normalized
als1 = [als11',als21',alsder11',alsder21',maxfreq(als11)',maxfreq(als21)',indexmaxfreq(als11)',indexmaxfreq(als21)',rmsfreq(als11)',rmsfreq(als21)',varfreq(als11)',varfreq(als21)',abstime(als11)',abstime(als21)',integtime(als11)',integtime(als21)',log(als11)',log(als21)',dct(als11)',dct(als21)'];
disp('job done')                                                                                                                                                                                                                                                               
als2 = [als12',als22',alsder12',alsder22',maxfreq(als12)',maxfreq(als22)',indexmaxfreq(als12)',indexmaxfreq(als22)',rmsfreq(als12)',rmsfreq(als22)',varfreq(als12)',varfreq(als22)',abstime(als12)',abstime(als22)',integtime(als12)',integtime(als22)',log(als12)',log(als22)',dct(als12)',dct(als22)'];
disp('job done')                                                                                                                                                                                                                                                                
als3 = [als13',als23',alsder13',alsder23',maxfreq(als13)',maxfreq(als23)',indexmaxfreq(als13)',indexmaxfreq(als23)',rmsfreq(als13)',rmsfreq(als23)',varfreq(als13)',varfreq(als23)',abstime(als13)',abstime(als23)',integtime(als13)',integtime(als23)',log(als13)',log(als23)',dct(als13)',dct(als23)'];
disp('job done')                                                                                                                                                                                                                                                                
als4 = [als14',als24',alsder14',alsder24',maxfreq(als14)',maxfreq(als24)',indexmaxfreq(als14)',indexmaxfreq(als24)',rmsfreq(als14)',rmsfreq(als24)',varfreq(als14)',varfreq(als24)',abstime(als14)',abstime(als24)',integtime(als14)',integtime(als24)',log(als14)',log(als24)',dct(als14)',dct(als24)'];
als5 = [als15',als25',alsder15',alsder25',maxfreq(als15)',maxfreq(als25)',indexmaxfreq(als15)',indexmaxfreq(als25)',rmsfreq(als15)',rmsfreq(als25)',varfreq(als15)',varfreq(als25)',abstime(als15)',abstime(als25)',integtime(als15)',integtime(als25)',log(als15)',log(als25)',dct(als15)',dct(als25)'];
als6 = [als16',als26',alsder16',alsder26',maxfreq(als16)',maxfreq(als26)',indexmaxfreq(als16)',indexmaxfreq(als26)',rmsfreq(als16)',rmsfreq(als26)',varfreq(als16)',varfreq(als26)',abstime(als16)',abstime(als26)',integtime(als16)',integtime(als26)',log(als16)',log(als26)',dct(als16)',dct(als26)'];
als7 = [als17',als27',alsder17',alsder27',maxfreq(als17)',maxfreq(als27)',indexmaxfreq(als17)',indexmaxfreq(als27)',rmsfreq(als17)',rmsfreq(als27)',varfreq(als17)',varfreq(als27)',abstime(als17)',abstime(als27)',integtime(als17)',integtime(als27)',log(als17)',log(als27)',dct(als17)',dct(als27)'];
als8 = [als18',als28',alsder18',alsder28',maxfreq(als18)',maxfreq(als28)',indexmaxfreq(als18)',indexmaxfreq(als28)',rmsfreq(als18)',rmsfreq(als28)',varfreq(als18)',varfreq(als28)',abstime(als18)',abstime(als28)',integtime(als18)',integtime(als28)',log(als18)',log(als28)',dct(als18)',dct(als28)'];
control1 = [cntl11',cntl21',cntlder11',cntlder21',maxfreq(cntl11)',maxfreq(cntl21)',indexmaxfreq(cntl11)',indexmaxfreq(cntl21)',rmsfreq(cntl11)',rmsfreq(cntl21)',varfreq(cntl11)',varfreq(cntl21)',abstime(cntl11)',abstime(cntl21)',integtime(cntl11)',integtime(cntl21)',log(cntl11)',log(cntl21)',dct(cntl11)',dct(cntl21)'];
control2 = [cntl12',cntl22',cntlder12',cntlder22',maxfreq(cntl12)',maxfreq(cntl22)',indexmaxfreq(cntl12)',indexmaxfreq(cntl22)',rmsfreq(cntl12)',rmsfreq(cntl22)',varfreq(cntl12)',varfreq(cntl22)',abstime(cntl12)',abstime(cntl22)',integtime(cntl12)',integtime(cntl22)',log(cntl12)',log(cntl22)',dct(cntl12)',dct(cntl22)'];
control3 = [cntl13',cntl23',cntlder13',cntlder23',maxfreq(cntl13)',maxfreq(cntl23)',indexmaxfreq(cntl13)',indexmaxfreq(cntl23)',rmsfreq(cntl13)',rmsfreq(cntl23)',varfreq(cntl13)',varfreq(cntl23)',abstime(cntl13)',abstime(cntl23)',integtime(cntl13)',integtime(cntl23)',log(cntl13)',log(cntl23)',dct(cntl13)',dct(cntl23)'];
control4 = [cntl14',cntl24',cntlder14',cntlder24',maxfreq(cntl14)',maxfreq(cntl24)',indexmaxfreq(cntl14)',indexmaxfreq(cntl24)',rmsfreq(cntl14)',rmsfreq(cntl24)',varfreq(cntl14)',varfreq(cntl24)',abstime(cntl14)',abstime(cntl24)',integtime(cntl14)',integtime(cntl24)',log(cntl14)',log(cntl24)',dct(cntl14)',dct(cntl24)'];
control5 = [cntl15',cntl25',cntlder15',cntlder25',maxfreq(cntl15)',maxfreq(cntl25)',indexmaxfreq(cntl15)',indexmaxfreq(cntl25)',rmsfreq(cntl15)',rmsfreq(cntl25)',varfreq(cntl15)',varfreq(cntl25)',abstime(cntl15)',abstime(cntl25)',integtime(cntl15)',integtime(cntl25)',log(cntl15)',log(cntl25)',dct(cntl15)',dct(cntl25)'];
control6 = [cntl16',cntl26',cntlder16',cntlder26',maxfreq(cntl16)',maxfreq(cntl26)',indexmaxfreq(cntl16)',indexmaxfreq(cntl26)',rmsfreq(cntl16)',rmsfreq(cntl26)',varfreq(cntl16)',varfreq(cntl26)',abstime(cntl16)',abstime(cntl26)',integtime(cntl16)',integtime(cntl26)',log(cntl16)',log(cntl26)',dct(cntl16)',dct(cntl26)'];
control7 = [cntl17',cntl27',cntlder17',cntlder27',maxfreq(cntl17)',maxfreq(cntl27)',indexmaxfreq(cntl17)',indexmaxfreq(cntl27)',rmsfreq(cntl17)',rmsfreq(cntl27)',varfreq(cntl17)',varfreq(cntl27)',abstime(cntl17)',abstime(cntl27)',integtime(cntl17)',integtime(cntl27)',log(cntl17)',log(cntl27)',dct(cntl17)',dct(cntl27)'];
control8 = [cntl18',cntl28',cntlder18',cntlder28',maxfreq(cntl18)',maxfreq(cntl28)',indexmaxfreq(cntl18)',indexmaxfreq(cntl28)',rmsfreq(cntl18)',rmsfreq(cntl28)',varfreq(cntl18)',varfreq(cntl28)',abstime(cntl18)',abstime(cntl28)',integtime(cntl18)',integtime(cntl28)',log(cntl18)',log(cntl28)',dct(cntl18)',dct(cntl28)'];
control14 = [cntl114',cntl214',cntlder114',cntlder214',maxfreq(cntl114)',maxfreq(cntl214)',indexmaxfreq(cntl114)',indexmaxfreq(cntl214)',rmsfreq(cntl114)',rmsfreq(cntl214)',varfreq(cntl114)',varfreq(cntl214)',abstime(cntl114)',abstime(cntl214)',integtime(cntl114)',integtime(cntl214)',log(cntl114)',log(cntl214)',dct(cntl114)',dct(cntl214)'];
control15 = [cntl115',cntl215',cntlder115',cntlder215',maxfreq(cntl115)',maxfreq(cntl215)',indexmaxfreq(cntl115)',indexmaxfreq(cntl215)',rmsfreq(cntl115)',rmsfreq(cntl215)',varfreq(cntl115)',varfreq(cntl215)',abstime(cntl115)',abstime(cntl215)',integtime(cntl115)',integtime(cntl215)',log(cntl115)',log(cntl215)',dct(cntl115)',dct(cntl215)'];
control16 = [cntl116',cntl216',cntlder116',cntlder216',maxfreq(cntl116)',maxfreq(cntl216)',indexmaxfreq(cntl116)',indexmaxfreq(cntl216)',rmsfreq(cntl116)',rmsfreq(cntl216)',varfreq(cntl116)',varfreq(cntl216)',abstime(cntl116)',abstime(cntl216)',integtime(cntl116)',integtime(cntl216)',log(cntl116)',log(cntl216)',dct(cntl116)',dct(cntl216)'];
hunt1= [hunt11',hunt21',huntder11',huntder21',maxfreq(hunt11)',maxfreq(hunt21)',indexmaxfreq(hunt11)',indexmaxfreq(hunt21)',rmsfreq(hunt11)',rmsfreq(hunt21)',varfreq(hunt11)',varfreq(hunt21)',abstime(hunt11)',abstime(hunt21)',integtime(hunt11)',integtime(hunt21)',log(hunt11)',log(hunt21)',dct(hunt11)',dct(hunt21)'];
hunt2= [hunt12',hunt22',huntder12',huntder22',maxfreq(hunt12)',maxfreq(hunt22)',indexmaxfreq(hunt12)',indexmaxfreq(hunt22)',rmsfreq(hunt12)',rmsfreq(hunt22)',varfreq(hunt12)',varfreq(hunt22)',abstime(hunt12)',abstime(hunt22)',integtime(hunt12)',integtime(hunt22)',log(hunt12)',log(hunt22)',dct(hunt12)',dct(hunt22)'];
hunt3= [hunt13',hunt23',huntder13',huntder23',maxfreq(hunt13)',maxfreq(hunt23)',indexmaxfreq(hunt13)',indexmaxfreq(hunt23)',rmsfreq(hunt13)',rmsfreq(hunt23)',varfreq(hunt13)',varfreq(hunt23)',abstime(hunt13)',abstime(hunt23)',integtime(hunt13)',integtime(hunt23)',log(hunt13)',log(hunt23)',dct(hunt13)',dct(hunt23)'];
hunt4= [hunt14',hunt24',huntder14',huntder24',maxfreq(hunt14)',maxfreq(hunt24)',indexmaxfreq(hunt14)',indexmaxfreq(hunt24)',rmsfreq(hunt14)',rmsfreq(hunt24)',varfreq(hunt14)',varfreq(hunt24)',abstime(hunt14)',abstime(hunt24)',integtime(hunt14)',integtime(hunt24)',log(hunt14)',log(hunt24)',dct(hunt14)',dct(hunt24)'];
hunt5= [hunt15',hunt25',huntder15',huntder25',maxfreq(hunt15)',maxfreq(hunt25)',indexmaxfreq(hunt15)',indexmaxfreq(hunt25)',rmsfreq(hunt15)',rmsfreq(hunt25)',varfreq(hunt15)',varfreq(hunt25)',abstime(hunt15)',abstime(hunt25)',integtime(hunt15)',integtime(hunt25)',log(hunt15)',log(hunt25)',dct(hunt15)',dct(hunt25)'];
hunt6= [hunt16',hunt26',huntder16',huntder26',maxfreq(hunt16)',maxfreq(hunt26)',indexmaxfreq(hunt16)',indexmaxfreq(hunt26)',rmsfreq(hunt16)',rmsfreq(hunt26)',varfreq(hunt16)',varfreq(hunt26)',abstime(hunt16)',abstime(hunt26)',integtime(hunt16)',integtime(hunt26)',log(hunt16)',log(hunt26)',dct(hunt16)',dct(hunt26)'];
hunt7= [hunt17',hunt27',huntder17',huntder27',maxfreq(hunt17)',maxfreq(hunt27)',indexmaxfreq(hunt17)',indexmaxfreq(hunt27)',rmsfreq(hunt17)',rmsfreq(hunt27)',varfreq(hunt17)',varfreq(hunt27)',abstime(hunt17)',abstime(hunt27)',integtime(hunt17)',integtime(hunt27)',log(hunt17)',log(hunt27)',dct(hunt17)',dct(hunt27)'];
hunt8= [hunt18',hunt28',huntder18',huntder28',maxfreq(hunt18)',maxfreq(hunt28)',indexmaxfreq(hunt18)',indexmaxfreq(hunt28)',rmsfreq(hunt18)',rmsfreq(hunt28)',varfreq(hunt18)',varfreq(hunt28)',abstime(hunt18)',abstime(hunt28)',integtime(hunt18)',integtime(hunt28)',log(hunt18)',log(hunt28)',dct(hunt18)',dct(hunt28)'];
hunt14= [hunt114',hunt214',huntder114',huntder214',maxfreq(hunt114)',maxfreq(hunt214)',indexmaxfreq(hunt114)',indexmaxfreq(hunt214)',rmsfreq(hunt114)',rmsfreq(hunt214)',varfreq(hunt114)',varfreq(hunt214)',abstime(hunt114)',abstime(hunt214)',integtime(hunt114)',integtime(hunt214)',log(hunt114)',log(hunt214)',dct(hunt114)',dct(hunt214)'];
hunt15= [hunt115',hunt215',huntder115',huntder215',maxfreq(hunt115)',maxfreq(hunt215)',indexmaxfreq(hunt115)',indexmaxfreq(hunt215)',rmsfreq(hunt115)',rmsfreq(hunt215)',varfreq(hunt115)',varfreq(hunt215)',abstime(hunt115)',abstime(hunt215)',integtime(hunt115)',integtime(hunt215)',log(hunt115)',log(hunt215)',dct(hunt115)',dct(hunt215)'];
hunt16= [hunt116',hunt216',huntder116',huntder216',maxfreq(hunt116)',maxfreq(hunt216)',indexmaxfreq(hunt116)',indexmaxfreq(hunt216)',rmsfreq(hunt116)',rmsfreq(hunt216)',varfreq(hunt116)',varfreq(hunt216)',abstime(hunt116)',abstime(hunt216)',integtime(hunt116)',integtime(hunt216)',log(hunt116)',log(hunt216)',dct(hunt116)',dct(hunt216)'];
hunt17= [hunt117',hunt217',huntder117',huntder217',maxfreq(hunt117)',maxfreq(hunt217)',indexmaxfreq(hunt117)',indexmaxfreq(hunt217)',rmsfreq(hunt117)',rmsfreq(hunt217)',varfreq(hunt117)',varfreq(hunt217)',abstime(hunt117)',abstime(hunt217)',integtime(hunt117)',integtime(hunt217)',log(hunt117)',log(hunt217)',dct(hunt117)',dct(hunt217)'];
hunt18= [hunt118',hunt218',huntder118',huntder218',maxfreq(hunt118)',maxfreq(hunt218)',indexmaxfreq(hunt118)',indexmaxfreq(hunt218)',rmsfreq(hunt118)',rmsfreq(hunt218)',varfreq(hunt118)',varfreq(hunt218)',abstime(hunt118)',abstime(hunt218)',integtime(hunt118)',integtime(hunt218)',log(hunt118)',log(hunt218)',dct(hunt118)',dct(hunt218)'];
hunt19= [hunt119',hunt219',huntder119',huntder219',maxfreq(hunt119)',maxfreq(hunt219)',indexmaxfreq(hunt119)',indexmaxfreq(hunt219)',rmsfreq(hunt119)',rmsfreq(hunt219)',varfreq(hunt119)',varfreq(hunt219)',abstime(hunt119)',abstime(hunt219)',integtime(hunt119)',integtime(hunt219)',log(hunt119)',log(hunt219)',dct(hunt119)',dct(hunt219)'];
hunt20= [hunt120',hunt220',huntder120',huntder220',maxfreq(hunt120)',maxfreq(hunt220)',indexmaxfreq(hunt120)',indexmaxfreq(hunt220)',rmsfreq(hunt120)',rmsfreq(hunt220)',varfreq(hunt120)',varfreq(hunt220)',abstime(hunt120)',abstime(hunt220)',integtime(hunt120)',integtime(hunt220)',log(hunt120)',log(hunt220)',dct(hunt120)',dct(hunt220)'];
park1= [park11',park21',parkder11',parkder21',maxfreq(park11)',maxfreq(park21)',indexmaxfreq(park11)',indexmaxfreq(park21)',rmsfreq(park11)',rmsfreq(park21)',varfreq(park11)',varfreq(park21)',abstime(park11)',abstime(park21)',integtime(park11)',integtime(park21)',log(park11)',log(park21)',dct(park11)',dct(park21)'];
park2= [park12',park22',parkder12',parkder22',maxfreq(park12)',maxfreq(park22)',indexmaxfreq(park12)',indexmaxfreq(park22)',rmsfreq(park12)',rmsfreq(park22)',varfreq(park12)',varfreq(park22)',abstime(park12)',abstime(park22)',integtime(park12)',integtime(park22)',log(park12)',log(park22)',dct(park12)',dct(park22)'];
park3= [park13',park23',parkder13',parkder23',maxfreq(park13)',maxfreq(park23)',indexmaxfreq(park13)',indexmaxfreq(park23)',rmsfreq(park13)',rmsfreq(park23)',varfreq(park13)',varfreq(park23)',abstime(park13)',abstime(park23)',integtime(park13)',integtime(park23)',log(park13)',log(park23)',dct(park13)',dct(park23)'];
park4= [park14',park24',parkder14',parkder24',maxfreq(park14)',maxfreq(park24)',indexmaxfreq(park14)',indexmaxfreq(park24)',rmsfreq(park14)',rmsfreq(park24)',varfreq(park14)',varfreq(park24)',abstime(park14)',abstime(park24)',integtime(park14)',integtime(park24)',log(park14)',log(park24)',dct(park14)',dct(park24)'];
park5= [park15',park25',parkder15',parkder25',maxfreq(park15)',maxfreq(park25)',indexmaxfreq(park15)',indexmaxfreq(park25)',rmsfreq(park15)',rmsfreq(park25)',varfreq(park15)',varfreq(park25)',abstime(park15)',abstime(park25)',integtime(park15)',integtime(park25)',log(park15)',log(park25)',dct(park15)',dct(park25)'];
park6= [park16',park26',parkder16',parkder26',maxfreq(park16)',maxfreq(park26)',indexmaxfreq(park16)',indexmaxfreq(park26)',rmsfreq(park16)',rmsfreq(park26)',varfreq(park16)',varfreq(park26)',abstime(park16)',abstime(park26)',integtime(park16)',integtime(park26)',log(park16)',log(park26)',dct(park16)',dct(park26)'];
park7= [park17',park27',parkder17',parkder27',maxfreq(park17)',maxfreq(park27)',indexmaxfreq(park17)',indexmaxfreq(park27)',rmsfreq(park17)',rmsfreq(park27)',varfreq(park17)',varfreq(park27)',abstime(park17)',abstime(park27)',integtime(park17)',integtime(park27)',log(park17)',log(park27)',dct(park17)',dct(park27)'];
park8= [park18',park28',parkder18',parkder28',maxfreq(park18)',maxfreq(park28)',indexmaxfreq(park18)',indexmaxfreq(park28)',rmsfreq(park18)',rmsfreq(park28)',varfreq(park18)',varfreq(park28)',abstime(park18)',abstime(park28)',integtime(park18)',integtime(park28)',log(park18)',log(park28)',dct(park18)',dct(park28)'];
park14 = [park114',park214',parkder114',parkder214',maxfreq(park114)',maxfreq(park214)',indexmaxfreq(park114)',indexmaxfreq(park214)',rmsfreq(park114)',rmsfreq(park214)',varfreq(park114)',varfreq(park214)',abstime(park114)',abstime(park214)',integtime(park114)',integtime(park214)',log(park114)',log(park214)',dct(park114)',dct(park214)'];
park15 = [park115',park215',parkder115',parkder215',maxfreq(park115)',maxfreq(park215)',indexmaxfreq(park115)',indexmaxfreq(park215)',rmsfreq(park115)',rmsfreq(park215)',varfreq(park115)',varfreq(park215)',abstime(park115)',abstime(park215)',integtime(park115)',integtime(park215)',log(park115)',log(park215)',dct(park115)',dct(park215)'];

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