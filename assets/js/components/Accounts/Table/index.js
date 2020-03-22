import React from "react";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";
import Link from "@material-ui/core/Link";

import ThemeProvider from "../../shared/ThemeProvider";
import getCSRFToken from "../../../helpers/getCSRFToken";

const csrfToken = getCSRFToken();

function AccountsTable({ accounts }) {
  return (
    <ThemeProvider>
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell align="right">Balance</TableCell>
              <TableCell />
            </TableRow>
          </TableHead>
          <TableBody>
            {accounts.map(account => (
              <TableRow key={account.id}>
                <TableCell component="th" scope="row">
                  {account.name}
                </TableCell>
                <TableCell align="right">${account.balance}</TableCell>
                <TableCell align="center">
                  <Link href={`accounts/${account.id}/edit`}>
                    <EditIcon />
                  </Link>
                  <Link
                    href={`accounts/${account.id}`}
                    data-confirm="Are you sure?"
                    data-method="delete"
                    data-to={`/accounts/${account.id}`}
                    data-csrf={csrfToken}
                    rel="nofollow"
                  >
                    <DeleteIcon />
                  </Link>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </ThemeProvider>
  );
}

export default AccountsTable;
