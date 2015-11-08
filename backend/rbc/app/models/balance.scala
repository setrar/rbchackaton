package models

case class Balance(
    account: String
  , balance: String
  , balanceDiff: String
  , time: String) extends TBalance

case class EntityBalance(
  id: Long
  , account: String
  , balance: String
  , balanceDiff: String
  , time: String) extends TBalance with TId
