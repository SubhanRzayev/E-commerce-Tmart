# Generated by Django 3.2.4 on 2021-08-06 18:27

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('city', models.CharField(max_length=100)),
            ],
            options={
                'verbose_name_plural': 'cities',
            },
        ),
        migrations.CreateModel(
            name='Color',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('color', models.CharField(max_length=50)),
                ('is_published', models.BooleanField(blank=True, default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Price',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.CharField(default='0.00$ - 50.00$', max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('slug', models.CharField(blank=True, max_length=300, null=True, unique=True, verbose_name='Slug')),
                ('price', models.DecimalField(decimal_places=2, default=0.0, max_digits=7)),
                ('quantity', models.IntegerField(blank=True, default=1, null=True)),
                ('discount_price', models.DecimalField(blank=True, decimal_places=2, default=0.0, max_digits=7, null=True)),
                ('winter', models.BooleanField(default=False)),
                ('spring', models.BooleanField(default=False)),
                ('autumn', models.BooleanField(default=False)),
                ('summer', models.BooleanField(default=False)),
                ('cover_image', models.ImageField(upload_to='product_cover_image')),
                ('description', models.TextField(default='Write your text', max_length=1000)),
                ('stock', models.BooleanField(default=False)),
                ('digital', models.BooleanField(blank=True, default=False, null=True)),
                ('video', models.TextField(default='https:something/something/...', max_length=200)),
                ('sale', models.IntegerField(blank=True, default=0, null=True)),
                ('sale_time', models.DateField(blank=True, null=True)),
                ('is_published', models.BooleanField(blank=True, default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('colors', models.ManyToManyField(db_index=True, related_name='product_color', to='products.Color')),
                ('prices_range', models.ManyToManyField(blank=True, db_index=True, related_name='_products_product_prices_range_+', to='products.Price')),
            ],
        ),
        migrations.CreateModel(
            name='Size',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('size', models.TextField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='SortBy',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sortby', models.CharField(max_length=70)),
            ],
            options={
                'verbose_name': 'SortBy',
                'verbose_name_plural': 'SortsBy',
            },
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rate', models.IntegerField(blank=True, default=0, null=True)),
                ('name', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=80)),
                ('message', models.TextField(max_length=500)),
                ('is_published', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('comment', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='comments', to='products.review')),
                ('product', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='review', to='products.product')),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='sizes',
            field=models.ManyToManyField(blank=True, db_index=True, related_name='product_size', to='products.Size'),
        ),
        migrations.AddField(
            model_name='product',
            name='sortsby',
            field=models.ManyToManyField(blank=True, db_index=True, related_name='product_filter', to='products.SortBy'),
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(default='IMG.JPG', upload_to='product_image')),
                ('product', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='product_image', to='products.product')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('title_en', models.CharField(max_length=50, null=True)),
                ('title_az', models.CharField(max_length=50, null=True)),
                ('title_tr', models.CharField(max_length=50, null=True)),
                ('image', models.ImageField(blank=True, default='IMG.JPG', null=True, upload_to='home_category_images')),
                ('is_published', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='categories', to='products.category')),
                ('products', models.ManyToManyField(blank=True, db_index=True, default='Something', related_name='product_categories', to='products.Product')),
            ],
            options={
                'verbose_name': 'Category',
                'verbose_name_plural': 'Categories',
            },
        ),
    ]
