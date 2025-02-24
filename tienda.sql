-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libros` (
  `ISBN` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `ano_publicacion` YEAR NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`secciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`secciones` (
  `id_seccion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_seccion`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`copias_libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`copias_libros` (
  `id_copia` INT NOT NULL AUTO_INCREMENT,
  `id_seccion` INT NOT NULL,
  `ISBN` INT NOT NULL,
  PRIMARY KEY (`id_copia`),
  INDEX `fk_copias_libros_secciones1_idx` (`id_seccion` ASC),
  INDEX `fk_copias_libros_libros1_idx` (`ISBN` ASC),
  CONSTRAINT `fk_copias_libros_secciones1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `biblioteca`.`secciones` (`id_seccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_copias_libros_libros1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `biblioteca`.`libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`miembros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`miembros` (
  `id_miembro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `telefono` VARCHAR(30) NULL,
  PRIMARY KEY (`id_miembro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`prestamos` (
  `id_prestamo` INT NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` DATE NOT NULL,
  `fecha_devolucion_prevista` DATE NOT NULL,
  `fecha_devolucion_real` DATE NULL,
  `id_miembro` INT NOT NULL,
  `id_copia` INT NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  INDEX `fk_prestamos_miembros1_idx` (`id_miembro` ASC),
  INDEX `fk_prestamos_copias_libros1_idx` (`id_copia` ASC),
  CONSTRAINT `fk_prestamos_miembros1`
    FOREIGN KEY (`id_miembro`)
    REFERENCES `biblioteca`.`miembros` (`id_miembro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamos_copias_libros1`
    FOREIGN KEY (`id_copia`)
    REFERENCES `biblioteca`.`copias_libros` (`id_copia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`libros_autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libros_autores` (
  `ISBN` INT NOT NULL,
  `id_autor` INT NOT NULL,
  PRIMARY KEY (`ISBN`, `id_autor`),
  INDEX `fk_libros_has_autores_autores1_idx` (`id_autor` ASC),
  INDEX `fk_libros_has_autores_libros_idx` (`ISBN` ASC),
  CONSTRAINT `fk_libros_has_autores_libros`
    FOREIGN KEY (`ISBN`)
    REFERENCES `biblioteca`.`libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_has_autores_autores1`
    FOREIGN KEY (`id_autor`)
    REFERENCES `biblioteca`.`autores` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
