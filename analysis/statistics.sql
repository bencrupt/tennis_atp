select p.*,
(convert(decimal, (select sum(im.WinnerBpSaved) from ImportMatch im where im.WinnerId = p.Id)) + convert(decimal, (select sum(im.LoserBpSaved) from ImportMatch im where im.LoserId = p.Id))) / (convert(decimal, (select sum(im.WinnerBpFaced) from ImportMatch im where im.WinnerId = p.Id)) + convert(decimal, (select sum(im.LoserBpFaced) from ImportMatch im where im.LoserId = p.Id))) BpEfficiency,
convert(decimal, (select sum(im.WinnerBpSaved) from ImportMatch im where im.WinnerId = p.Id) + (select sum(im.LoserBpSaved) from ImportMatch im where im.LoserId = p.Id)) BpSaved,
convert(decimal, (select sum(im.WinnerBpFaced) from ImportMatch im where im.WinnerId = p.Id) + (select sum(im.LoserBpFaced) from ImportMatch im where im.LoserId = p.Id)) BpFaced,
(select sum(im.WinnerBpSaved) from ImportMatch im where im.WinnerId = p.Id) BpSavedWinner,
(select sum(im.WinnerBpFaced) from ImportMatch im where im.WinnerId = p.Id) BpFacedWinner,
(select sum(im.LoserBpSaved) from ImportMatch im where im.LoserId = p.Id) BpSavedLoser,
(select sum(im.LoserBpFaced) from ImportMatch im where im.LoserId = p.Id) BpFacedLoser
--(select convert(int, 100*round(convert(decimal, sum(case when winnerid=p.Id then winnerbpsaved else LoserBpSaved end)) / convert(decimal, sum(case when winnerid=p.Id then WinnerBpFaced else LoserBpFaced end)), 2)) from ImportMatch where winnerid=104269 or LoserId=104269) BpWon
from Player p
where p.Id in (select im.WinnerId from ImportMatch im) or p.Id in (select im.LoserId from ImportMatch im)
order by 1