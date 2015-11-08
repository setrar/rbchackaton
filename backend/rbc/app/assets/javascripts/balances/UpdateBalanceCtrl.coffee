class UpdateBalanceCtrl

  constructor: (@$log, @$location, @$routeParams, @BalanceService) ->
      @$log.debug "constructing UpdateBalanceController"
      @balance = {}
      @findBalance()

  updateBalance: () ->
      @$log.debug "updateBalance()"
      @balance.active = true
      @BalanceService.updateBalance(@$routeParams.number, @balance)
      .then(
          (data) =>
            @$log.debug "Promise returned #{data} Balance"
            @balance = data
            @$location.path("/")
        ,
        (error) =>
            @$log.error "Unable to update Balance: #{error}"
      )

  findBalance: () ->
      # route params must be same name as provided in routing url in app.coffee
      number    = @$routeParams.number
      @$log.debug "findBalance route params: #{number}"

      @BalanceService.listBalances()
      .then(
        (data) =>
          @$log.debug "Promise returned #{data.length} Balances"

          # find a balance with the number and bandName
          # as filter returns an array, get the first object in it, and return it
          @balance = (data.filter (balance) -> balance.number is number )[0]
      ,
        (error) =>
          @$log.error "Unable to get Balances: #{error}"
      )

controllersModule.controller('UpdateBalanceCtrl', ['$log', '$location', '$routeParams', 'BalanceService', UpdateBalanceCtrl])