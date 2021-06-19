package house

import (
	"time"

	"github.com/shopspring/decimal"
)

type (
	ID    string
	House struct {
		ID              ID
		Address         string
		Town            string
		ContractedPrice decimal.Decimal
		ContractDate    time.Time
		DateSold        time.Time
		Sold            bool
		PointOfContact  string
		Notes           string
	}
)
