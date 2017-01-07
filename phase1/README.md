
# Phase 1

課題: [チケット・改札機問題](https://gist.github.com/JunichiIto/39caae4f1c90499e2239785c3faf1b75)

レベルA（コード本体もテストコードもすべて回答者自身で考えて書く）を対象とする。

## Gemの生成・テストの実行

```
bundle gem --test=rspec train-ticket
cd train-ticket
vim train-ticket.gemspec
bundle
rake
```

## 擬似コード

### シナリオ1

ticket_vendor     = TicketVendor.new(station_name: StationName::UMEDA)
ticket_gate_umeda = TicketGate.new(station_name: StationName::UMEDA)
ticket_gate_juso  = TicketGate.new(station_name: StationName::JUSO)

# 150円の普通乗車券を発券する
unused_ticket = ticket_vendor.issue_ordinary_ticket(150)
# 梅田駅で入場する。
entered_ticket, enter_result = ticket_gate_umeda.enter(unused_ticket)
# 十三駅で出場する。
used_ticket, leave_result = ticket_gate_juso.leave(entered_ticket)

#### タスク

* [x] StationNameクラスを作成する。
* [ ] Ticketクラスを作成する。
* [ ] TicketVendorクラスを作成する。
* [ ] TicketGateクラスを作成する。
