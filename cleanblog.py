from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import os
import math
# from flask_mail import Mail
from datetime import datetime

app = Flask(__name__)
app.secret_key='super-secret-key'
app.config['UPLOAD_FOLDER'] = 'C:\\Users\\admin\\PycharmProjects\\web_development_flask\\static'

# app.config.update(
#     MAIL_SERVER='smtp.gmail.com',
#     MAIL_PORT='465',
#     MAIL_USE_SSL=True,
#     MAIL_USERNAME='saif.lokhand10@gmail.com',
#     MAIL_PASSWORD='saifuddin@55')
# mail = Mail(app)


app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/safina'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app)


@app.route("/")
def home():
    post1 = Post.query.filter_by().all()
    last = math.ceil(len(post1)/int('2'))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    post1 = post1[(page-1) * int('2'): (page-1) * int('2') + int('2')]
    #pagination logic

    if (page==1):
        prev = "#"
        next = "/?page="+ str(page + 1)
    elif (page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('cleanblog.html', post=post1, prev=prev, next=next)


class Contact(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80), unique=False, nullable=False)
    Email = db.Column(db.String(25), unique=True, nullable=False)
    Phone_number = db.Column(db.String(12), unique=True, nullable=False)
    Message = db.Column(db.String(150), unique=False, nullable=False)
    Date = db.Column(db.String(), unique=False, nullable=False)


class Post(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(80), unique=False, nullable=False)
    Slug = db.Column(db.String(25), unique=True, nullable=False)
    Content = db.Column(db.String(150), unique=True, nullable=False)
    Date = db.Column(db.String(), unique=False, nullable=False)
    Img_file = db.Column(db.String(), unique=False, nullable=False)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post(post_slug):
    post = Post.query.filter_by(Slug=post_slug).first()
    return render_template('post.html', post=post)

@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == 'saif'):
        if (request.method=='POST'):
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "UPLOAD SUCCESSFULL"

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == 'saif'):
        post = Post.query.filter_by(Sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone_number')
        message = request.form.get('message')
        entry = Contact(Name=name, Email=email, Phone_number=phone_num, Message=message, Date= datetime.now())
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   sender=email,
        #                   recipients="saifu.lokhand10@gmail.com",
        #                   body=message + "\n" + phone_num
        #                   )
    return render_template('contact.html')
@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == 'saif'):
        if request.method == 'POST':
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post = Post(Title=box_title, Slug=slug, Content=content, Img_file=img_file, Date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Post.query.filter_by(Sno=sno).first()
                post.Title = box_title
                post.Slug = slug
                post.Content = content
                post.Img_file = img_file
                post.Date = date
                db.session.commit()
                return redirect('/edit/'+ sno)
        post = Post.query.filter_by(Sno=sno).first()
        return render_template('edit.html', post=post)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():

    if('user' in session and session['user'] == 'saif'):
        post = Post.query.all()
        return render_template('dashboard.html', post = post)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == 'saif' and userpass == 'saif5'):
            #set the session variable
            session['user'] = username
            post = Post.query.all()
            return render_template('dashboard.html', post = post)

    return render_template('login.html')



app.run(debug=True)
