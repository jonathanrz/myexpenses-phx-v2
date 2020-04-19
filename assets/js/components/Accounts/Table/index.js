import React from "react";
import TableCell from "@material-ui/core/TableCell";
import Link from "@material-ui/core/Link";
import Currency from "../../../helpers/currency";

import ModelTable from "../../shared/ModelTable";

const PATH = "accounts";

function AccountsTable({ data }) {
  return (
    <ModelTable
      data={data}
      path={PATH}
      label="Account"
      renderHeaders={() => (
        <React.Fragment>
          <TableCell>Name</TableCell>
          <TableCell>Balance</TableCell>
        </React.Fragment>
      )}
      renderRowData={d => (
        <React.Fragment>
          <TableCell component="th" scope="row">
            <Link href={`${PATH}/${d.id}`}>{d.name}</Link>
          </TableCell>
          <TableCell>{Currency.format(d.balance)}</TableCell>
        </React.Fragment>
      )}
    />
  );
}

export default AccountsTable;
