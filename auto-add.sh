
unset NameResourceGroup
read -p "Nhap vao ten ResourceGroup: " NameResourceGroup
echo "Data received"
echo $NameResourceGroup >> GroupResource.txt

unset NameResourceGroup

echo "Cac Group Name Resource dang co"
echo "-----------------------------------"
cat GroupResource.txt
echo "-----------------------------------"
