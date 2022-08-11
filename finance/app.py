import os

from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from tempfile import mkdtemp
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd

# Configure application
app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True

# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")

# Make sure API key is set
if not os.environ.get("API_KEY"):
    raise RuntimeError("API_KEY not set")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/")
@login_required
def index():
    """Show portfolio of stocks"""
    return render_template("index.html")


@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    """Buy shares of stock"""
    if request.method == "GET":
        return render_template("buy.html")

    if request.method == "POST":
        symbol = request.form.get("symbol")
        shares = request.form.get("shares")
        # stock = lookup(symbol)
        # return render_template("quoted.html", name = display_symbol["name"], price = display_symbol["price"], sym = display_symbol["symbol"])

        if not symbol:
            return apology("No Symbol")
        if not shares:
            return apology("No Shares")

        # if stock == None:
        #     return apology("No Symbol")
    return apology("TODO")


@app.route("/history")
@login_required
def history():
    """Show history of transactions"""
    return apology("TODO")


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":

        # Ensure username was submitted
        if not request.form.get("username"):
            return apology("must provide username", 403)

        # Ensure password was submitted
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        # Query database for username
        rows = db.execute("SELECT * FROM users WHERE username = ?", request.form.get("username"))

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(rows[0]["hash"], request.form.get("password")):
            return apology("invalid username and/or password", 403)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")





# When form is submitted via POST, lookup the stock symbol by calling the lookup function
# and display the results

# Require that a user input a stock’s symbol, implemented as a text field
# whose name is symbol

# Submit the user’s input via POST to /quote.

# Odds are you’ll want to create two new templates (e.g., quote.html and quoted.html).
# When a user visits /quote via GET, render one of those templates, inside of
# which should be an HTML form that submits to /quote via POST.
# In response to a POST, quote can render that second template,
# embedding within it one or more values from lookup.
@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    """Get stock quote."""
     # When requested via GET, display form to request a stock quote
    if request.method == "GET":
        # displays quote form
        return render_template("quote.html")

    # When form is submitted via POST, lookup the stock symbol by calling the
    # lookup function and display the results
    if request.method == "POST":
        symbol = request.form.get("symbol")
        stock = lookup(symbol)
        # return render_template("quoted.html", name = display_symbol["name"], price = display_symbol["price"], sym = display_symbol["symbol"])

        if not symbol:
            return apology("No Symbol")

        if stock == None:
            return apology("No Symbol")

        return render_template("quoted.html", name = stock["name"], price = stock["price"], symbol = stock["symbol"])



    # return apology("TODO")


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""

    # When requested via GET, display registration form
    if request.method == "GET":
        # displays registration form
        return render_template("register.html")

    else:
        pw1 = request.form.get("password")
        pw2 = request.form.get("confirmation")

        username = request.form.get("username")
        # Hash the user’s password
        hash_pwd = generate_password_hash(pw1)

        # When form is submitted via POST, check for possible errors
        # Require that a user input a username
        # Require that a user input a password
        # Require that user's passwords match
        if not username:
             return apology("must provide username")

        if not pw1:
             return apology("must provide password")

        if pw1 != pw2:
            return apology("Incorrect password")

        # check_username = db.execute("SELECT username FROM users WHERE username = ?", request.form.get("username"))
        # if username is in the data base, return apology

        try:
            # db.execute("SELECT username FROM users WHERE username = ?", request.form.get("username"))

            # INSERT the new user into users, storing a hash of the user’s password,
            new_username = db.execute("INSERT INTO users (username, hash) VALUES (?, ?)", (username), (hash_pwd))
            # return render_template("login.html")
        except:
            return apology("Username Already Exists")

        print("Made it here")
        session["user_id"] = new_username
        return redirect("/")
        # if check_username[0]["username"] == request.form.get("username"):
            # return apology("Username Already Exists")

        # Else insert the new user into users table
        # else:
        #     db.execute("INSERT INTO users (username, hash) VALUES (?, ?)", (username), (hash_pwd))
        #     # return apology("Something")
        #     return render_template("login.html")


        # username = request.form.get("username")
        # return render_template("register.html")
        # return apology("TODO")


@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    """Sell shares of stock"""
    return apology("TODO")
