import React from "react";
import styled from "styled-components";
import { useTheme } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import TableCell from "@material-ui/core/TableCell";
import Link from "@material-ui/core/Link";
import moment from "moment";

import Currency from "../../../helpers/currency";
import { branch, themeColor } from "../../../helpers/theme";
import getCSRFToken from "../../../helpers/getCSRFToken";
import ModelTable from "../../shared/ModelTable";

const csrfToken = getCSRFToken();

const PATH = "expenses";

const ConfirmButton = styled(Button)`
  background-color: ${branch(
    "confirmed",
    themeColor("error.main"),
    themeColor("success.main")
  )};
  color: #ffffff;

  &:hover {
    background-color: ${branch(
      "confirmed",
      themeColor("error.light"),
      themeColor("success.light")
    )};
  }
`;

function ExpensesTable({ data }) {
  const theme = useTheme();

  function confirmLink(d) {
    return `/${PATH}/${d.id}/${d.confirmed ? "unconfirm" : "confirm"}`;
  }

  function renderName(d) {
    if (!d.installmentNumber || !d.installmentCount) return d.name;

    return `${d.name} ${d.installmentNumber}/${d.installmentCount}`;
  }

  return (
    <ModelTable
      data={data}
      path={PATH}
      label="Expense"
      renderHeaders={() => (
        <React.Fragment>
          <TableCell>Name</TableCell>
          <TableCell>Date</TableCell>
          <TableCell>Value</TableCell>
          <TableCell>Action</TableCell>
          <TableCell>Paid with</TableCell>
          <TableCell>Place</TableCell>
          <TableCell>Bill</TableCell>
          <TableCell>Category</TableCell>
        </React.Fragment>
      )}
      renderRowData={(d) => (
        <React.Fragment>
          <TableCell component="th" scope="row">
            <Link href={`${PATH}/${d.id}`}>{renderName(d)}</Link>
          </TableCell>
          <TableCell>{moment(d.date).format("DD/MM/YYYY")}</TableCell>
          <TableCell>{Currency.format(d.value)}</TableCell>
          <TableCell>
            <ConfirmButton
              variant="outlined"
              size="small"
              href={confirmLink(d)}
              data-confirm="Are you sure?"
              data-method="post"
              data-to={confirmLink(d)}
              data-csrf={csrfToken}
              rel="nofollow"
              theme={theme}
              // necessary to avoid html warnings
              confirmed={d.confirmed ? "confirmed" : undefined}
            >
              {d.confirmed ? "Unconfirm" : "Confirm"}
            </ConfirmButton>
          </TableCell>
          <TableCell>
            {d.credit_card ? (
              <Link href={`credit_cards/${d.credit_card.id}`}>
                {d.credit_card.name}
              </Link>
            ) : (
              <Link href={`accounts/${d.account.id}`}>{d.account.name}</Link>
            )}
          </TableCell>
          <TableCell>
            <Link href={`places/${d.place.id}`}>{d.place.name}</Link>
          </TableCell>
          <TableCell>
            <Link href={`bills/${d.bill.id}`}>{d.bill.name}</Link>
          </TableCell>
          <TableCell>
            <Link href={`categories/${d.category.id}`}>{d.category.name}</Link>
          </TableCell>
        </React.Fragment>
      )}
    />
  );
}

export default ExpensesTable;
