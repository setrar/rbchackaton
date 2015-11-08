package tables.seed

import java.text.SimpleDateFormat

import models.EntityBalance

/**
 *
 * Created by cravefm on 10/2/15.
 */
object InitBalances {

  val dateFormat = new SimpleDateFormat("MM/dd/yyyy")

  val list = List(
    EntityBalance(
        id = 1
      , account = "CHQ01"
      , balance = "$2,500.00"
      , balanceDiff = "+$100.00"
      , time = "5d9h"
    )
  ,
    EntityBalance(
      id = 1
      , account = "SAV01"
      , balance = "$15,500.00"
      , balanceDiff = "+$1,000.00"
      , time = "15d0h"
    )
  )
}
